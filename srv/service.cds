using my.starwars as sw from '../db/schema';

service StarWarsService {
    entity StarWarsFighter as projection on sw.StarWarsFighter;
}