SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# `on`,`off`による違いなし
sqlite3 :memory: \
".changes on" \
"create table T(C text);" \
"insert into T values('A');" \
"insert into T values('A');" \
"update T set C='B' where C='A';" \
"select changes();"

sqlite3 :memory: \
".changes off" \
"create table T(C text);" \
"insert into T values('A');" \
"insert into T values('A');" \
"update T set C='B' where C='A';" \
"select changes();"

# ちなみに以下はエラー。
#   Usage: .changes on|off
sqlite3 :memory: \
".changes on" \
"create table T(C text);" \
"insert into T values('A');" \
"insert into T values('A');" \
"update T set C='B' where C='A';" \
".changes"
#   Error: near "changes": syntax error
sqlite3 :memory: \
".changes on" \
"create table T(C text);" \
"insert into T values('A');" \
"insert into T values('A');" \
"update T set C='B' where C='A';" \
"changes()"

