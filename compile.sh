#!/usr/bin/env bash

function join_by { local IFS="$1"; shift; echo "$*"; }

# Scalac binary
scalac=${1}

# Scala version
if [ "${2}" = "2-12" ]
then
	version="2-12"
else
	version="2-11"
fi

classpath_shrinker=(${version}-cp-shrinker/*.jar)
regular_jars=(${version}/*.jar)
macro_jars=(${version}-macro/*.jar)

# Whether to include the macro jars or not
if [ "${3}" = "nomacro" ]
then
	jars=("${regular_jars[@]}")
else
	jars=("${regular_jars[@]}" "${macro_jars[@]}")
fi
cp=$(join_by ":" "${jars[@]}")

cmd="${scalac} -Xplugin:${classpath_shrinker} -cp "${cp}" Foo.scala"
echo ${cmd}
${cmd}
