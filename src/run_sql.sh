SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# SQLファイル作成
echo "create table T(C text);
insert into T values('A');
insert into T values('A');
update T set C='B' where C='A';
select changes();" > 0.sql

echo "loop-----"
# SQLファイル実行
for path in `ls -1 | grep .sql$ | sort`; do
	echo $path
	sqlite3 < $path
done

echo ".changes デフォルト-----"
sqlite3 :memory: ".read 0.sql"
echo ".changes on-----"
sqlite3 :memory: ".changes on" ".read 0.sql"
echo ".changes off-----"
sqlite3 :memory: ".changes off" ".read 0.sql"

