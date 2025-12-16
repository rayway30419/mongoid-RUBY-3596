const admin = db.getSiblingDB("admin");
const res = admin.runCommand({
  addShard: "shardRS/sh1a.test.local:27018,sh1b.test.local:27018,sh1c.test.local:27018",
});
printjson(res);
