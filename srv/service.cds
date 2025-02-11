using my.starwars as sw from '../db/schema';

service StarWarsService {
    entity StarWarsFighter as projection on sw.StarWarsFighter;
    entity FighterStatus as projection on sw.FighterStatus;
}