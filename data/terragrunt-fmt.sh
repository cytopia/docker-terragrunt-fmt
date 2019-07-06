#!/usr/bin/env bash

# Be strict
set -e
set -u
set -o pipefail


# --------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------
ARG_LIST=1
ARG_WRITE=0
ARG_DIFF=0
ARG_CHECK=0
ARG_RECURSIVE=0
ARG_IGNORE=
ARG_PATH=


# --------------------------------------------------------------------------------
# FUNCTIONS
# --------------------------------------------------------------------------------

###
### Show Usage
###
print_usage() {
	echo "Usage: cytopia/terragrunt-fmt [options] [DIR]"
	echo "       cytopia/terragrunt-fmt --help"
	echo "       cytopia/terragrunt-fmt --version"
	echo
	echo "       Rewrites all Terragrunt configuration files to a canonical format. All"
	echo "       hcl configuration files (.hcl) are updated."
	echo
	echo "       If DIR is not specified then the current working directory will be used."
	echo
	echo "Options:"
	echo
	echo "  -list=true     List files whose formatting differs"
	echo
	echo "  -write=false   Don't write to source files"
	echo "                 (always disabled if using -check)"
	echo
	echo "  -diff          Display diffs of formatting changes"
	echo
	echo "  -check         Check if the input is formatted. Exit status will be 0 if all"
	echo "                 input is properly formatted and non-zero otherwise."
	echo
	echo "  -recursive     Also process files in subdirectories. By default, only the"
	echo "                 given directory (or current directory) is processed."
	echo
	echo "  -ignore=a,b    Comma separated list of paths to ignore."
	echo "                 The wildcard character '*' is supported."
}


_fmt() {
	local list="${1}"
	local write="${2}"
	local diff="${3}"
	local check="${4}"
	local file="${5}"
	# shellcheck disable=SC2155
	local temp="/tmp/$(basename "${file}").tf"
	local ret=0

	# Build command (only append if default values are overwritten)
	local cmd="terraform fmt"
	if [ "${list}" = "0" ]; then
		cmd="${cmd} -list=false"
	else
		cmd="${cmd} -list=true"
	fi
	if [ "${write}" = "1" ]; then
		cmd="${cmd} -write=true"
	else
		cmd="${cmd} -write=false"
	fi
	if [ "${diff}" = "1" ]; then
		cmd="${cmd} -diff"
	fi
	if [ "${check}" = "1" ]; then
		cmd="${cmd} -check"
	fi

	# Output and execute command
	echo "${cmd} ${file}"
	cp -f "${file}" "${temp}"
	if ! eval "${cmd} ${temp}"; then
		ret=$(( ret + 1 ))
	fi

	# If -write was specified, copy file back
	if [ "${write}" = "1" ]; then
		# Get owner and permissions of current file
		_UID="$(stat -c %u "${file}")"
		_GID="$(stat -c %g "${file}")"
		_PERM="$(stat -c %a "${file}")"

		# Adjust permissions of temporary file
		chown ${_UID}:${_GID} "${temp}"
		chmod ${_PERM} "${temp}"

		# Overwrite existing file
		mv -f "${temp}" "${file}"
	fi
	return "${ret}"
}


# --------------------------------------------------------------------------------
# ENTRYPOINT (EVALUATE ARGUMENTS)
# --------------------------------------------------------------------------------
if [ "${#}" -gt "0" ]; then

	while [ "${#}" -gt "0"  ]; do
		case "${1}" in
			# Show Help and exit
			--help)
				print_usage
				exit 0
				;;
			# Show Version and exit
			--version)
				terraform --version
				exit 0
				;;
			# List files
			-list | -list=*)
				if [ "${1}" = "-list" ]; then
					ARG_LIST=1
				else
					_ARG="${1##*=}"
					if [ "${_ARG}" = "true" ]; then
						ARG_LIST=1
					elif [ "${_ARG}" = "false" ]; then
						ARG_LIST=0
					else
						>&2 echo "Error, -list can only be set to 'true' or 'false', you had: '${_ARG}'"
						exit 1
					fi
				fi
				shift
				;;
			# Write files
			-write | -write=*)
				if [ "${1}" = "-write" ]; then
					if [ "${ARG_CHECK}" = "1" ]; then
						>&2 echo "Error, -check and -write cannot be used together"
						exit 1
					fi
					ARG_WRITE=1
				else
					_ARG="${1##*=}"
					if [ "${_ARG}" = "true" ]; then
						if [ "${ARG_CHECK}" = "1" ]; then
							>&2 echo "Error, -check and -write=true cannot be used together"
							exit 1
						fi
						ARG_WRITE=1
					elif [ "${_ARG}" = "false" ]; then
						ARG_WRITE=0
					else
						>&2 echo "Error, -write can only be set to 'true' or 'false', you had: '${_ARG}'"
						exit 1
					fi
				fi
				shift
				;;
			# Diff files
			-diff | -diff=*)
				if [ "${1}" = "-diff" ]; then
					ARG_DIFF=1
				else
					_ARG="${1##*=}"
					if [ "${_ARG}" = "true" ]; then
						ARG_DIFF=1
					elif [ "${_ARG}" = "false" ]; then
						ARG_DIFF=0
					else
						>&2 echo "Error, -diff can only be set to 'true' or 'false', you had: '${_ARG}'"
						exit 1
					fi
				fi
				shift
				;;
			# Check files
			-check | -check=*)
				if [ "${1}" = "-check" ]; then
					if [ "${ARG_WRITE}" = "1" ]; then
						>&2 echo "Error, -check and -write=true cannot be used together"
						exit 1
					fi
					ARG_CHECK=1
				else
					_ARG="${1##*=}"
					if [ "${_ARG}" = "true" ]; then
						if [ "${ARG_WRITE}" = "1" ]; then
							>&2 echo "Error, -check=true and -write=true cannot be used together"
							exit 1
						fi
						ARG_CHECK=1
					elif [ "${_ARG}" = "false" ]; then
						ARG_CHECK=0
					else
						>&2 echo "Error, -check can only be set to 'true' or 'false', you had: '${_ARG}'"
						exit 1
					fi
				fi
				shift
				;;
			# Recursive apply
			-recursive | -recursive=*)
				if [ "${1}" = "-recursive" ]; then
					ARG_RECURSIVE=1
				else
					_ARG="${1##*=}"
					if [ "${_ARG}" = "true" ]; then
						ARG_RECURSIVE=1
					elif [ "${_ARG}" = "false" ]; then
						ARG_RECURSIVE=0
					else
						>&2 echo "Error, -recursive can only be set to 'true' or 'false', you had: '${_ARG}'"
						exit 1
					fi
				fi
				shift
				;;
			# Paths to ignore
			-ignore | -ignore=*)
				if [ "${1}" = "-ignore" ]; then
					if [ "${#}" -lt "2" ]; then
						>&2 echo "Error, '${1}' requires an argument"
						exit 1
					fi
					shift
					ARG_IGNORE="${1}"
				else
					ARG_IGNORE="${1##*=}"
				fi
				shift
				;;
			# Any other arguments are invalid
			-*)
				>&2 echo "Error, '${1}' is an unsupported argument"
				print_usage
				exit 1
				;;
			# Anything else is the [DIR]
			*)
				# ---- Case 1/3: Its a file ----
				if [ -f "${1}" ]; then
					# Argument check
					if [ "${1##*.}" != "hcl" ]; then
						>&2 echo "Error, only .hcl files are supported."
						exit 1
					fi
					if [ "${#}" -gt "1" ]; then
						>&2 echo "Error, you cannot specify arguments after the [DIR] position."
						print_usage
						exit 1
					fi
					if [ "${ARG_RECURSIVE}" = "1" ]; then
						>&2 echo "Error, -recursive makes no sense on a single file."
						exit 1
					fi

				# ---- Case 2/3: Its a directory ----
				elif [ -d "${1}" ]; then
					# Argument check
					if [ "${#}" -gt "1" ]; then
						>&2 echo "Error, you cannot specify arguments after the [DIR] position."
						print_usage
						exit 1
					fi
				# ---- Case 3/3: File or directory does not exist ----
				else
					>&2 echo "Error, file or directory does not exist: ${1}"
					exit 1
				fi
				ARG_PATH="${1}"
				shift
				;;
		esac
	done
fi


# --------------------------------------------------------------------------------
# ENTRYPOINT (TERRAFORM FMT)
# --------------------------------------------------------------------------------

# If no [DIR] was specified, use current directory
if [ -z "${ARG_PATH}" ]; then
	ARG_PATH="."
fi


###
### (1/3) Single file
###
if [ -f "${ARG_PATH}" ]; then
	_fmt "${ARG_LIST}" "${ARG_WRITE}" "${ARG_DIFF}" "${ARG_CHECK}" "${ARG_PATH}"
	exit "${?}"
else
	###
	### (2/3) Recursive directory
	###
	if [ "${ARG_RECURSIVE}" = "1" ]; then

		# evaluate ignore paths
		if [ -n "${ARG_IGNORE}" ]; then
			_EXCLUDE=" -not \( -path \"${ARG_PATH}/${ARG_IGNORE//,/*\" -o -path \"${ARG_PATH}\/}*\" \)"
		else
			_EXCLUDE=""
		fi

		find_cmd="find ${ARG_PATH}${_EXCLUDE} -name '*.hcl' -type f -print0"
		echo "[INFO] Finding files: ${find_cmd}"
		ret=0
		while IFS= read -rd '' file; do
			if ! _fmt "${ARG_LIST}" "${ARG_WRITE}" "${ARG_DIFF}" "${ARG_CHECK}" "${file}"; then
				ret="1"
			fi
		done < <(eval "${find_cmd}")
		exit "${ret}"

	###
	### (3/3) Current directory only
	###
	else
		find_cmd="ls ${ARG_PATH}/*.hcl"
		echo "[INFO] Finding files: ${find_cmd}"
		ret=0
		while IFS= read -r file; do
			if ! _fmt "${ARG_LIST}" "${ARG_WRITE}" "${ARG_DIFF}" "${ARG_CHECK}" "${file}"; then
				ret="1"
			fi
		done < <(eval "${find_cmd}" 2>/dev/null)
		exit "${ret}"
	fi
fi
