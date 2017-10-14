#!/usr/bin/env bash
# Author .......: Sotirios M. Roussis (xtonousou) <xtonousou@gmail.com>
# Description ..: Unofficial client library for ipify: A Simple IP Address API.
# Exit Values ..: {"0": "successful", "1": "arg issues", "2": "connection issues"}
# Dependencies .: bash>=3.2, coreutils, curl
# Linter .......: shellcheck
# Date .........: Sat Oct 14 14:55:37 EEST 2017

get_ip() {

  declare PRINTF

  PRINTF=$(which printf)

  help() {
    "${PRINTF}" \
      "%s%17s%8s\n%s%7s%19s\n%s%7s%16s\n%s%7s%25s\n%s%7s%35s\n%s%6s%32s\n" \
      "COMMAND" "TYPE" "OUTPUT" \
      "get_ip -h, --help" "text" "This help message" \
      "get_ip -t, --text" "text" "98.207.254.136" \
      "get_ip -j, --json" "json" "{\"ip\":\"98.207.254.136\"}" \
      "get_ip -J, --jsonp" "jsonp" "callback({\"ip\":\"98.207.254.136\"});" \
      "get_ip -g, --get-ip" "jsonp" "getip({\"ip\":\"98.207.254.136\"});"

    return 0
  }
  
  [ "${#}" -eq 0 ] && help && return 1

  declare CURL
  declare API_URI
  declare RESPONSE

  CURL=$(which curl)
  API_URI="https://api.ipify.org"

  case "${1}" in
  "-h"|"--help")
    help && return 0
    ;;
  "-t"|"--text")
    ;;
  "-j"|"--json")
    API_URI+="?format=json"
    ;;
  "-J"|"--jsonp")
    API_URI+="?format=jsonp"
    ;;
  "-g"|"--get-ip")
    API_URI+="?format=jsonp&callback=getip"
    ;;
  *)
    help && return 1
    ;;
  esac

  if ! RESPONSE=$("${CURL}" --disable --fail --silent "${API_URI}"); then
    "${PRINTF}" "ipify: check your internet connection" && return 2
  fi

  "${PRINTF}" "%s" "${RESPONSE}"

  unset PRINTF
  unset CURL
  unset API_URI
  unset RESPONSE

  return 0
}
