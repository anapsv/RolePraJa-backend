import joi from 'joi';
import { INewCommentData } from '../types/commentTypes';

const commentSchema = joi.object<INewCommentData>({
    content: joi.string().max(100).required()
});

export default commentSchema;