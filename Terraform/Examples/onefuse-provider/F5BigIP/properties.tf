locals  {
partition = "Common"
pool = format("/%s/%s", local.partition, onefuse_naming.pool.name)
virtualserver = format("/%s/%s", local.partition, onefuse_naming.pool.name)
}