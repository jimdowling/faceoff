#private_ip = my_private_ip()
#public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/home/faceoff"
   user node['faceoff']['user']
  group node['faceoff']['group']
  interpreter "bash"
  code <<-EOM
cd /usr/local/flink
./bin/flink run -p #{node.numWorkers} -j ./examples/flink-java-examples-0.9.1-WordCount.jar hdfs:///User/flink/apache.txt hdfs://10.0.2.15/User/flink/wordcount-result-flink.txt

cd /srv/spark
./bin/spark run -p #{node.numWorkers} -j ./examples/spark-java-examples-1.3.1-WordCount.jar hdfs:///User/spark/apache.txt hdfs:///10.0.2.15/User/spark/wordcount-result-spark.txt

/srv/hadoop/bin/hdfs dfs -copyToLocal hdfs:///10.0.2.15/User/flink/wordcount-result-spark.txt /tmp/spark-wc.txt
/srv/hadoop/bin/hdfs dfs -copyToLocal hdfs:///10.0.2.15/User/spark/wordcount-result-spark.txt /tmp/spark-wc.txt

echo "Results:nFlink: " > /tmp/faceoff_experiment.out
wc -l /tmp/flink-wc.txt >> /tmp/faceoff_experiment.out
echo "nSpark: " >> /tmp/faceoff_experiment.out
wc -l /tmp/spark-wc.txt >> /tmp/faceoff_experiment.out
echo -n "" >> /tmp/faceoff_experiment.out

echo "bye"
 
  EOM
end

