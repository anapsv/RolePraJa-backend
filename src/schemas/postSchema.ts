import joi from 'joi';
import { IPostBody } from '../types/postTypes';

const postSchema = joi.object<IPostBody>({
    content: joi.string().max(180).required()
});

export default postSchema;
