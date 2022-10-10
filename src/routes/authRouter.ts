import { Router } from "express";
import { loginUser, registerUser, accessFeed } from "../controllers/authController";
import validateSchema from "../middlewares/schemaValidator";
import registerSchema from "../schemas/registerSchema";
import loginSchema from "../schemas/loginSchema";
import validateToken from "../middlewares/tokenValidator";

const authRouter = Router();

authRouter.post('/signup', validateSchema(registerSchema), registerUser);
authRouter.post('/signin', validateSchema(loginSchema), loginUser);
authRouter.get('/feed', validateToken, accessFeed);

export default authRouter;