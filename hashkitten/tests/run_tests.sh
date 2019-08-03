#!/bin/sh
for _test in $(find . -name "*.test" -type f); do
    if [ "$(sh ./$_test)" != $(cat $_test.expect) ]; then
        echo "FAILED: $_test"
        exit 1
    else
        echo "PASSED: $_test"
    fi
done
echo "DONE: all tests passed"
exit 0
