import joi from 'joi';
import { INewPostData } from '../types/postTypes';

const postSchema = joi.object<INewPostData>({
    content: joi.string().max(180).required(),
    image: joi.binary().optional()
});

export default postSchema;
