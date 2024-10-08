import {NestInterceptor, ExecutionContext, CallHandler} from '@nestjs/common';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';
import {isObject, isArray} from 'lodash';
import {classToPlain} from 'class-transformer';

export class TransformInterceptor implements NestInterceptor {
    intercept(
        context: ExecutionContext,
        next: CallHandler<any>,
    ): Observable<any> {
        return next.handle().pipe(
            map(res => (isObject(res) ? this.transformResponse(res) : res)),
        );
    }

    transformResponse(response) {
        if (isArray(response)) {
            return response.map(item => this.transformToPlain(item));
        }
        return this.transformToPlain(response);
    }

    transformToPlain(plainOrClass) {
        return plainOrClass && plainOrClass.constructor !== Object
            ? classToPlain(plainOrClass)
            : plainOrClass;
    }
}