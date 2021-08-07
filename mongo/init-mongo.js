db.createUser(
 {
   user: "my-mongo",
   pwd: "qwerty",
   roles: [
            {
                role: "readWrite",
                db: "my-datastore"
            }
          ]
 }
)
