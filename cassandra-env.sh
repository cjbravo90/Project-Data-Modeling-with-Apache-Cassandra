# Cassandra environment configuration file

# Overrides these for production
JVM_OPTS="$JVM_OPTS -Xms512M"
JVM_OPTS="$JVM_OPTS -Xmx512M"
JVM_OPTS="$JVM_OPTS -Xmn100M"
JVM_OPTS="$JVM_OPTS -XX:+UseParNewGC"
JVM_OPTS="$JVM_OPTS -XX:+UseConcMarkSweepGC"
JVM_OPTS="$JVM_OPTS -XX:+CMSParallelRemarkEnabled"
JVM_OPTS="$JVM_OPTS -XX:SurvivorRatio=8"
JVM_OPTS="$JVM_OPTS -XX:MaxTenuringThreshold=1"
JVM_OPTS="$JVM_OPTS -XX:CMSInitiatingOccupancyFraction=75"
JVM_OPTS="$JVM_OPTS -XX:+UseCMSInitiatingOccupancyOnly"
JVM_OPTS="$JVM_OPTS -XX:+UseTLAB"
JVM_OPTS="$JVM_OPTS -XX:CompileCommandSpeedIter=4"
JVM_OPTS="$JVM_OPTS -XX:CMSFullGCsBeforeCompaction=4"
JVM_OPTS="$JVM_OPTS -XX:+UseBiasedLocking"
JVM_OPTS="$JVM_OPTS -XX:+UseCompressedOops"