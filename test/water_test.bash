#!/bin/bash
# SPDX-FileCopyrightText: 2024 Mori Yoshizumi <Viimaple1001@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause
# このプログラムはRyuichi Ueda先生のコードの一部を参照しており、ご貢献に感謝します。

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### 正常な入力 ###
out=$(echo 60 | ./work)
[ "${out}" = "1.98" ] || ng "$LINENO"

### 無効な入力 ###
out=$(echo a | ./work 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -1 | ./work 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "" | ./work 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit $res
