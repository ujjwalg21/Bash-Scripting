
#!/bin/bash

goalkeeper=1
defender=2
midfielder=3
forward=4

sed -i "s|"Goalkeeper"|$goalkeeper|g" input.csv
sed -i "s|"Defender"|$defender|g" input.csv
sed -i "s|"Midfielder"|$midfielder|g" input.csv
sed -i "s|"Forward"|$forward|g" input.csv

cat $1 | awk -F ',' '{print $1","$12","$7","$16}' | sort -t ',' -k4 -k3 -nr >> temp.csv

#sed -i "s/$goalkeeper/"Goalkeeper"/g" output.csv
#sed -i "s/$defender/"Defender"/g" output.csv
#sed -i "s/$midfielder/"Midfielder"/g" output.csv
#sed -i "s/$forward/"Forward"/g" output.csv

awk 'BEGIN {FS=OFS=","}

{
	if( $3 == 1 ) {
		$3 = "Goalkeeper"
	}
	else if( $3 == 2 ) {
                $3 = "Defender"
        }
	else if( $3 == 3 ) {
                $3 = "Midfielder"
        }
	else if( $3 == 4 ) {
                $3 = "Forward"
        }
	print $0


}' temp.csv >> $2 


