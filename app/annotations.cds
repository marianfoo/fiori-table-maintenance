using my.starwars as sw from '../db/schema';

// Property annotations with titles
annotate sw.StarWarsFighter with {
    name                @title: 'Fighter Name';
    manufacturer        @title: 'Manufacturer';
    model              @title: 'Model';
    fighterCategory    @title: 'Fighter Category';
    crewSize           @title: 'Crew Size';
    status             @title: 'Status';
    maxAtmosphericSpeed @title: 'Maximum Atmospheric Speed';
    laserCannons       @title: 'Number of Laser Cannons';
};

// UI Annotations for StarWarsFighter entity
annotate sw.StarWarsFighter with @(
    UI: {
        SelectionFields: [
            name,
            manufacturer,
            fighterCategory,
            status_code
        ],
        LineItem: [
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: 'Fighter Name'
            },
            {
                $Type: 'UI.DataField',
                Value: manufacturer,
                Label: 'Manufacturer'
            },
            {
                $Type: 'UI.DataField',
                Value: model,
                Label: 'Model'
            },
            {
                $Type: 'UI.DataField',
                Value: fighterCategory,
                Label: 'Category'
            },
            {
                $Type: 'UI.DataField',
                Value: crewSize,
                Label: 'Crew Size'
            },
            {
                $Type: 'UI.DataField',
                Value: status.name,
                Label: 'Status'
            },
            {
                $Type: 'UI.DataField',
                Value: maxAtmosphericSpeed,
                Label: 'Max Speed'
            },
            {
                $Type: 'UI.DataField',
                Value: laserCannons,
                Label: 'Laser Cannons'
            }
        ]
    }
); 