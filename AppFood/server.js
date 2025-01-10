import express from "express";
import rootRouter from "./src/routes/root.router.js";
import { handleError } from "./src/common/helpers/error.helper.js";
import cors from 'cors'

const app = express();
app.use(express.json());
app.use(cors({
    origin: ['http://localhost:5173', 'google.com']
}));

app.use(rootRouter)

app.use(handleError);

app.listen(3069, () => {
  console.log(`Server Online At Port 3069`);
});


//npx sequelize-auto -h localhost -d db_app_food -u root -x 1234 -p 3307  --dialect mysql -o src/models -a src/models/additional.json -l esm