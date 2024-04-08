import { HttpErrorResponse } from "@angular/common/http";
import { ErrorHandler, Injectable } from "@angular/core";

@Injectable()
export class ErrorHandlerService implements ErrorHandler {
    handleError(error: any): void {
        if(error instanceof HttpErrorResponse) {
            window.alert(error.message);
            if(error.status === 401) {
                window.location.assign("");
            }
        } else {
            console.error(error)
        }
    }
    
}