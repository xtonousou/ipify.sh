#!/usr/bin/env bash
# Author .......: Sotirios M. Roussis (xtonousou) <xtonousou@gmail.com>
# Description ..: Unofficial client library for ipify: A Simple IP Address API.
# Exit Values ..: {"0": "successful", "1": "no args", "2": "connection issues"}
# Dependencies .: bash>=3.2, coreutils, curl
# Linter .......: shellcheck
# Date .........: 20170831

function get_ip() {
  function help() {
    printf "%s%16s%8s\n%s%7s%16s\n%s%7s%25s\n%s%7s%35s\n%s%6s%32s" \
      "COMMAND" "TYPE" "OUTPUT" \
      "ipify -t, --text" "text" "98.207.254.136" \
      "ipify -j, --json" "json" "{\"ip\":\"98.207.254.136\"}" \
      "ipify -J, --jsonp" "jsonp" "callback({\"ip\":\"98.207.254.136\"});" \
      "ipify -G, --get-ip" "jsonp" "getip({\"ip\":\"98.207.254.136\"});"

    return 0
  }
  
  [ "${#}" -eq 0 ] && help && return 1
  
  declare API_URI
  declare RESPONSE

  case "${1}" in
    "-t"|"--text")
      API_URI="https://api.ipify.org"
    ;;
    "-j"|"--json")
      API_URI="https://api.ipify.org?format=json"
    ;;
    "-J"|"--jsonp")
      API_URI="https://api.ipify.org?format=jsonp"
    ;;
    "-G"|"--get-ip")
      API_URI="https://api.ipify.org?format=jsonp&callback=getip"
    ;;
  esac

  if ! RESPONSE=$($(which curl) --disable --fail --silent "${API_URI}")
  then
    printf "ipify: check your internet connection" && return 2
  fi

  printf "%s" "${RESPONSE}"

  unset API_URI
  unset RESPONSE

  return 0
}
