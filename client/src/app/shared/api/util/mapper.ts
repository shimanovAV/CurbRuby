import {Injectable} from '@angular/core';

@Injectable()
export class MapService {

  constructor() {
  }

  mapResponse(response: any) {
    return {
      result: response.result,
      description: response.description,
      winner_bet: {
        photo_url: response.winner_bet.photo_url,
        name: response.winner_bet.name
      }
    };
  }

  simpleResponse(response: any) {
    return response;
  }
}
