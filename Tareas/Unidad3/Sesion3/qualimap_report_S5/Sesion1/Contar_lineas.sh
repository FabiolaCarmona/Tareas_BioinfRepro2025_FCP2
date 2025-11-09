for f in S5*.fastq.gz; do
  echo "------ $f ------"
  n=$(zcat $f | wc -l)
  echo "Número total de líneas: $n"
  echo "Número de reads: $(($n/4))"
done

