using my.starwars as sw from '../db/schema';

// Property annotations with titles
annotate sw.StarWarsFighter with {
    name                @title: 'Fighter Name'
                       @Core.Computed;
    manufacturer        @title: 'Manufacturer'
                       @Core.Computed;
    model              @title: 'Model'
                       @Core.Computed;
    fighterCategory    @title: 'Fighter Category'
                       @Core.Computed;
    crewSize           @title: 'Crew Size'
                       @Core.Computed;
    maxAtmosphericSpeed @title: 'Maximum Atmospheric Speed'
                       @Core.Computed;
    laserCannons       @title: 'Number of Laser Cannons'
                       @Core.Computed;
    
    // Additional physical properties
    builtAt             @title: 'Build Date'
                       @Core.Computed;
    height             @title: 'Height (m)'
                       @Core.Computed;
    weight             @title: 'Weight (kg)'
                       @Core.Computed;
    length             @title: 'Length (m)'
                       @Core.Computed;
    width              @title: 'Width (m)'
                       @Core.Computed;
    
    // Additional specifications
    passengerCapacity  @title: 'Passenger Capacity'
                       @Core.Computed;
    propulsion         @title: 'Propulsion System'
                       @Core.Computed;
    maxAcceleration    @title: 'Maximum Acceleration'
                       @Core.Computed;
    hyperdriveClass    @title: 'Hyperdrive Class'
                       @Core.Computed;
    
    // Weapons and systems
    protonTorpedoCapacity @title: 'Proton Torpedo Capacity'
                         @Core.Computed;
    additionalWeapons    @title: 'Additional Weapons'
                        @Core.Computed;
    
    // Status
    status             @title: 'Operational Status';
    id                @title: 'Fighter ID'
                     @Core.Computed;
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
                Value: status_code,
                Label: 'Status'
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

// Add this after the existing annotations
annotate sw.StarWarsFighter with {
    status @(
        Common: {
            ValueListWithFixedValues: true,
            Text: status.name,
            TextArrangement: #TextOnly,
            ValueList: {
                Label: 'Fighter Status',
                CollectionPath: 'FighterStatus',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty: status_code,
                        ValueListProperty: 'code'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description'
                    }
                ]
            }
        }
    );
}

// Add after the existing StarWarsFighter annotations
annotate sw.FighterStatus with @(
    UI: {
        LineItem: [
            {
                $Type: 'UI.DataField',
                Value: code,
                Label: 'Status Code'
            },
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: 'Status Name'
            },
            {
                $Type: 'UI.DataField',
                Value: description,
                Label: 'Description'
            },
            {
                $Type: 'UI.DataField',
                Value: isOperational,
                Label: 'Is Operational'
            }
        ],
        SelectionFields: [
            code,
            name,
            isOperational
        ]
    }
);

// Add title annotations for FighterStatus
annotate sw.FighterStatus with {
    code           @title: 'Status Code';
    name           @title: 'Status Name';
    description    @title: 'Description';
    isOperational  @title: 'Is Operational';
}; 