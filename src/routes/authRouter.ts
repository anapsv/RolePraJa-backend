import { Router } from "express";
import { loginUser, registerUser } from "../controllers/authController";
import validateSchema from "../middlewares/schemaValidator";
import registerSchema from "../schemas/registerSchema";
import loginSchema from "../schemas/loginSchema";

const authRouter = Router();

authRouter.post('/signup', validateSchema(registerSchema), registerUser);
authRouter.post('/signin', validateSchema(loginSchema), loginUser);

export default authRouter;