rs.initiate({
  _id: "shardRS",
  members: [
    { _id: 0, host: "sh1a.test.local:27018" },
    { _id: 1, host: "sh1b.test.local:27018" },
    { _id: 2, host: "sh1c.test.local:27018" },
  ],
});
