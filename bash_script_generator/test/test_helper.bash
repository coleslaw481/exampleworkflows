#!/usr/bin/env bats

#
# Called by bats before the start of every test
# 
setup() {
  
  # Set the name of the workflow
  WF="${BATS_TEST_DIRNAME}/../src/example.kar"

  # Set kepler.sh script
  KEPLER_SH="kepler.sh"
  WORKFLOW_FAILED_TXT="WORKFLOW.FAILED.txt"
  README_TXT="README.txt"
  WORKFLOW_STATUS="workflow.status"

  # Create a temp directory and copy over bin/ directory
  export THE_TMP="${BATS_TMPDIR}/"`uuidgen`
  /bin/mkdir -p $THE_TMP
  /bin/cp -a "${BATS_TEST_DIRNAME}/bin" "${THE_TMP}/."

  # Wipe out .kepler folder cause it causes problems
  /bin/rm -rf ~/.kepler
}


#
# Called by bats after every test and it simply deletes the
# temp directory created by setup()
#
teardown() {
  # echo "Removing $THE_TMP" 1>&2
  /bin/rm -rf $THE_TMP
}

#
# Helper functio to verify $KEPLER_SH is in path if not skip whatever test we are in
#
skipIfKeplerNotInPath() {

  # verify $KEPLER_SH is in path if not skip this test
  run which $KEPLER_SH

  if [ "$status" -eq 1 ] ; then
    skip "$KEPLER_SH is not in path"
  fi

}

#
# Simple function to print all values passed in via echo command
# invoke like so: echoArray "${lines[@]}"
#
echoArray() {
  
  localArr=("$@")
  for Y in ${localArr[@]}; do
    echo $Y
  done
}
