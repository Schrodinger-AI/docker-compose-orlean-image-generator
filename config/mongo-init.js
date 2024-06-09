db = db.getSiblingDB("admin");
db.auth(
  process.env.MONGO_INITDB_ROOT_USERNAME,
  process.env.MONGO_INITDB_ROOT_PASSWORD
);
// log as root admin if you decided to authenticate in your docker-compose file...
db = db.getSiblingDB("orleans_image_generator");
db.createUser({
  user: process.env.MONGO_USER,
  pwd: process.env.MONGO_PASSWORD,
  roles: [
    {
      role: "dbOwner",
      db: "orleans_image_generator",
    },
  ],
});
