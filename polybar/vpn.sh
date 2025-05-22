#!/bin/bash

status=""

# OpenVPN
if pgrep -x "openvpn" > /dev/null; then
	status="openvpn"
fi

# WireGuard
if command -v wg > /dev/null && [ -n "$(wg show interfaces)" ]; then
	INTERFACE=$(wg show interfaces | head -n 1)
	[ -n "$status" ] && status="$status + $INTERFACE" || status="$INTERFACE"
fi

# Tor
if rc-service tor status > /dev/null; then
	[ -n "$status" ] && status="$status + tor" || status="tor"
fi

[ -n "$status" ] && echo " $status" || echo
