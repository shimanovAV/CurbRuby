export class CurbResponse {
  result: string;
  description: string;
  winner_bet: Bet;
}

export class Bet {
  photo_url: string;
  name: string;
}

export class GameStatistics {
  id: number;
  user_choice: string;
  curb_choice: string;
  winner: string;
}
