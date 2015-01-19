#!/bin/bash


#logs to keep
#N=5

#if [-a turd$N.log] then
#	rm turd$N.log
#fi
#
#while [ $N -ge 1 ]
#do
#	mv turd$(($N-1)).log turd$N.log
#N=$(( $N - 1 ))
#done

touch turd.log

cat > rotate.txt <<EOF
"turd.log" {
	rotate 5
	dateext
	dateformat --%Y-%m-%d-:%s
}
EOF

logrotate -vf rotate.txt

rm rotate.txt
#daily

