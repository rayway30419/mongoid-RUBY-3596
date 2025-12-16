rs.initiate({
  _id: "cfgRS",
  configsvr: true,
  members: [
    { _id: 0, host: "cfg1.test.local:27019" },
    { _id: 1, host: "cfg2.test.local:27019" },
    { _id: 2, host: "cfg3.test.local:27019" },
  ],
});
