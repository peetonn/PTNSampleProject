#!/bin/sh

################################################################################
#
# setup
#
# author: Peter Gusev <gpeetonn@gmail.com>
# date: Jan 25, 2013
# version: 1.0
#
# This script prepares workspace for new iOS app Xcode project.
# It does the following:
# 	- renames files/directories appropriately by new project name
#	- configures project file for newly created project
# 	- clones submodules from remote servser (PTNArtifacts and OCMock libraries)
# 	- renames workspace
#
# Installation:
#
#   chmod +x setup
#
# to make it executable.
#
# usage:
#
#   setup <NewProjectName>
#
# examples:
#
#   ./setup SuperProject
#   ./setup "Super Project"
#
################################################################################

OLDNAME=PTNSampleProject
OLDWORKSPACE=PTNSample
NEWNAME=$1

# remove bad characters
NEWNAME=`echo "${NEWNAME}" | sed -e "s/[^a-zA-Z0-9_ -]//g"`

TMPFILE=/tmp/xcodeRename.$$

if [ "$NEWNAME" = "" ]; then
  echo "usage: $0 <ProjectName>"
  exit
fi

# be sure tmp file is writable
cp /dev/null ${TMPFILE}
if [ $? -ne 0 ]; then
  echo "tmp file ${TMPFILE} is not writable. Terminating."
  exit
fi

# create project name with unscores for spaces
OLDNAMEUSCORE=`echo "${OLDNAME}" | sed -e "s/ /_/g"`
NEWNAMEUSCORE=`echo "${NEWNAME}" | sed -e "s/ /_/g"`

echo renaming project...

#find text files, replace text
find "." | while read currFile
do
  # find files that are of type text
  file "${currFile}" | grep "text" > /dev/null
  if [ $? -eq 0 -a "${currFile}" != "setup" ]; then
    # see if old proj name with underscores is in the text
    grep "${OLDNAMEUSCORE}" "${currFile}" > /dev/null
    if [ $? -eq 0 ]; then
       # replace the text with new proj name
       #echo found "${OLDNAMEUSCORE}" in "${currFile}", replacing...
       sed -e "s/${OLDNAMEUSCORE}/${NEWNAMEUSCORE}/g" "${currFile}" > ${TMPFILE}
       mv ${TMPFILE} "${currFile}"              
       cp /dev/null ${TMPFILE}
    fi
    # see if old proj name is in the text
    grep "${OLDNAME}" "${currFile}" > /dev/null
    if [ $? -eq 0 ]; then
       # replace the text with new proj name
       #echo found "${OLDNAME}" in "${currFile}", replacing...
       sed -e "s/${OLDNAME}/${NEWNAME}/g" "${currFile}" > ${TMPFILE}
       mv ${TMPFILE} "${currFile}"              
       cp /dev/null ${TMPFILE}
    fi
  fi
done

# rename directories with underscores
find "." -maxdepth 1 -type dir | while read currFile
do
  echo "${currFile}" | grep "${OLDNAMEUSCORE}" > /dev/null
  if [ $? -eq 0 ]; then
    MOVETO=`echo "${currFile}" | sed -e "s/${OLDNAMEUSCORE}/${NEWNAMEUSCORE}/g"`
    #echo renaming "${currFile}" to "${MOVETO}"
    mv "${currFile}" "${MOVETO}"
  fi
done

# rename directories with spaces
find "." -maxdepth 1 -type dir | while read currFile
do
  echo "${currFile}" | grep "${OLDNAME}" > /dev/null
  if [ $? -eq 0 ]; then
    MOVETO=`echo "${currFile}" | sed -e "s/${OLDNAME}/${NEWNAME}/g"`
    #echo renaming "${currFile}" to "${MOVETO}"
    mv "${currFile}" "${MOVETO}"
  fi
done

# rename files with underscores
find "." -type file | while read currFile
do
  echo "${currFile}" | grep "${OLDNAMEUSCORE}" > /dev/null
  if [ $? -eq 0 ]; then
    MOVETO=`echo "${currFile}" | sed -e "s/${OLDNAMEUSCORE}/${NEWNAMEUSCORE}/g"`
    #echo renaming "${currFile}" to "${MOVETO}"
    mv "${currFile}" "${MOVETO}"
  fi
done

# rename files with spaces
find "." -type file | while read currFile
do
  echo "${currFile}" | grep "${OLDNAME}" > /dev/null
  if [ $? -eq 0 ]; then
    MOVETO=`echo "${currFile}" | sed -e "s/${OLDNAME}/${NEWNAME}/g"`
    #echo renaming "${currFile}" to "${MOVETO}"
    mv "${currFile}" "${MOVETO}"
  fi
done

rm -f ${TMPFILE}

echo renaming workspace...
mv "${OLDWORKSPACE}WS.xcworkspace" "${NEWNAMEUSCORE}WS.xcworkspace"

echo git submodules initialization...
git submodule init
git submodule update

echo removing git remote "origin"...
git remote rm origin

echo your workspace "${NEWNAMEUSCORE}WS" is ready for developing.

read -p "open Xcode?(y/n)[Y]?" REPLY
if [ "$REPLY" == "n" ]; then
	exit 1
fi

open -a Xcode "${NEWNAMEUSCORE}WS.xcworkspace"
