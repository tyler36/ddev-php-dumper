setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export PROJNAME=test-ddev-php-dumper
  export TESTDIR=~/tmp/${PROJNAME}
  mkdir -p $TESTDIR
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
}

health_checks() {
  # We can't really test the functionality but we can make sure it doesn't break the project.
  ddev exec "curl -s https://localhost:443/"
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}

  ddev config --project-name=${PROJNAME}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart

  health_checks
}

# bats test_tags=release
@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR}
  ddev config --project-name=${PROJNAME}
  echo "# ddev get tyler36/ddev-php-dumper with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get tyler36/ddev-php-dumper
  ddev restart

  health_checks
}
