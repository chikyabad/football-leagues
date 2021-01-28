using { football.leagues as f } from '../db/schema';

/**
 * Service definition
 */

service FootballLeague {
  entity leagues as projection on f.FootballLeagues;
  entity teams as projection on f.Teams;
  entity players as select from f.Players;
}

/**
 * UI Annotations
 */

annotate FootballLeague.leagues with @(

UI: {
        HeaderInfo: {
            TypeName: 'League',
            TypeNamePlural: 'Leagues',
            Title: { Value: id },
            Description: { Value: name }
        },
        SelectionFields: [ id, name, country, level ],
        LineItem: [
            { Value: id },
            { Value: name },
            { Value: country },
            { Value: level },              
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'League Information',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>characters}',
                Target : 'teams/@UI.LineItem'
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: id },
                { Value: name },
                { Value: country },
                { Value: level },              
            ]
        }
    }

);

annotate FootballLeague.teams with @(

UI: {
        HeaderInfo: {
            TypeName: 'Team',
            TypeNamePlural: 'Teams',
            Title: { Value: id },
            Description: { Value: name }
        },
        SelectionFields: [ id, name, stadiumName, city],
        LineItem: [
            { Value: id },
            { Value: name },
            { Value: stadiumName }, 
            { Value: city },             
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'League Information',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>characters}',
                Target : 'players/@UI.LineItem'
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: id },
                { Value: name },
                { Value: stadiumName },  
                { Value: city },              
            ]
        }
    }

);

annotate FootballLeague.players with @(

UI: {
        HeaderInfo: {
            TypeName: 'Player',
            TypeNamePlural: 'Players',
            Title: { Value: id },
            Description: { Value: name }
        },
        SelectionFields: [ id, name, surname, number],
        LineItem: [
            { Value: id },
            { Value: name },
            { Value: surname },  
            { Value: number },             
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'League Information',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            },
        ],        
        FieldGroup#Main: {
            Data: [
            { Value: id },
            { Value: name },
            { Value: surname },  
            { Value: number },             
            ]
        }
    }

);