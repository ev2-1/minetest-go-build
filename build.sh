#! /bin/sh
set -e

cd minetest-go/cmd/minetest-go
go build .
cd ../../..

cd plugins

go get github.com/ev2-1/minetest-go

for pl in $(ls -d */)
do
	echo $pl
	cd $pl
	#go get github.com/ev2-1/minetest-go/activeobject
	#go get github.com/ev2-1/minetest-go
	go build -buildmode=plugin -buildvcs=false	
	cd ..
done

cd ..

rm -f minetest-go/cmd/minetest-go/plugins/*
cp plugins/*/*.so minetest-go/cmd/minetest-go/plugins/

echo "[DONE] building"
echo "<>-------------"
echo ""
