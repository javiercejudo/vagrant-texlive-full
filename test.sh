#!/bin/bash

PASSED=true

if hash pdflatex 2>/dev/null; then
	echo "pdflatex installed!"
else
	echo >&2 "pdflatex not installed"
	PASSED=false
fi

if hash grunt 2>/dev/null; then
	echo "grunt installed!"
else
	echo >&2 "grunt not installed"
	PASSED=false
fi

if hash gulp 2>/dev/null; then
	echo "gulp installed!"
else
	echo >&2 "gulp not installed"
	PASSED=false
fi

if [[ $PASSED ]]; then
	echo "Done, without errors."
else
	echo "Done, with errors."
	exit 1
fi
