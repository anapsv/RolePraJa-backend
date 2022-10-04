import joi from 'joi';
import { IRegisterData } from '../types/authTypes';

const authSchema = joi.object<IRegisterData>({
    username: joi.string().max(20).required(),
    email: joi.string().email().required(),
    password: joi.string().min(10).required(),
    passwordConfirmation: joi.any().valid(joi.ref('password')).required()
});

export default authSchema;