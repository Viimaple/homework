#!/bin/bash
# SPDX-FileCopyrightText: 2024 Mori Yoshizumi <Viimaple1001@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause
# このプログラムはRyuichi Ueda先生のコードの一部を参照しており、ご貢献に感謝します。
# Ryuichi Ueda先生の入力検証部分を若干の修正と機能拡張をして使用します。
ng () {
    echo "${1}行目が違うよ" # エラーの処理と行番号の出力については、Ryuichi Ueda先生の ng 関数ロジックを参照してください。
    res=1
}

res=0

###正常な入力###
out=$(echo 60 | ./work)
[ "${out}" = "体重を入力してください[単位：kg]
あなたの体重に基づき、1日に必要な水分摂取量は1.98Lです。" ] || ng "$LINENO"

###変な入力###
out=$(echo a | ./work)
[ "$?" = 1 ]
[ "${out}" = "体重を入力してください[単位：kg]
無効な入力です。体重を数値で入力してください。" ] || ng "$LINENO"

out=$(echo   | ./work)
[ "$?" = 1 ]
[ "${out}" = "体重を入力してください[単位：kg]
無効な入力です。体重を数値で入力してください。" ] || ng "$LINENO"

out=$(echo -1 | ./work)
[ "$?" = 1 ]
[ "${out}" = "体重を入力してください[単位：kg]
有効な体重を入力してください" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit $res
