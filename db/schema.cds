namespace my.starwars;

/*
 * The FighterStatus entity represents possible operational states
 * of a starfighter, with additional details about each status.
 */
entity FighterStatus {
    key code: String;  // e.g. "AVAILABLE", "IN_MAINTENANCE"
    name: String;      // Display name e.g. "Available", "In Maintenance"
    description: String; // Optional description of the status
    isOperational: Boolean; // Indicates if fighter can be deployed in this status
    
    // Bidirectional association with StarWarsFighter
    fighters: Association to many StarWarsFighter on fighters.status = $self;
}

/*
 * The StarWarsFighter entity represents one fighter.
 * It includes both the initially defined properties and additional details
 * based on information from the Star Wars starfighters wiki article.
 */
entity StarWarsFighter {
    key id: String(10);
    name: String;  // e.g. "X-wing", "TIE Fighter", "A-wing", etc.

    // Manufacturer and Model details
    manufacturer: String;      // e.g. Incom Corporation, Kuat Systems Engineering, etc.
    model: String;             // Specific model of the starfighter (e.g. "T-65B", "A/SF-01", etc.)
    fighterCategory: String;   // General category, e.g. "Interceptor", "Assault", "Bomber", "Support"

    // Non‑editable properties (immutable once set)
    builtAt: Timestamp;  // Date/time the fighter was built
    height: Decimal(5,2);  // Height in meters (immutable)
    weight: Decimal(7,2); // Weight in kilograms (immutable)
    
    // Physical dimensions (in meters)
    length: Decimal(5,2);      // E.g. "16.90" for a B-wing fighter
    width: Decimal(5,2);       // E.g. "2.90" for a B-wing fighter

    // Crew and capacity specifications
    crewSize: Integer;         // Number of pilots/crew (often 1 for many starfighters)
    passengerCapacity: Integer; // Additional capacity (for troops or passengers in support crafts)

    // Propulsion and performance details
    propulsion: String;          // Description of the propulsion system (e.g. "Ion engine", "Hyperdrive-enabled")
    maxAtmosphericSpeed: String; // Maximum atmospheric speed (e.g. "950 km/h")
    maxAcceleration: String;     // Maximum acceleration (e.g. "2,390 G")
    hyperdriveClass: String;     // Hyperdrive rating, e.g. "1.0 HCR" (if applicable)
    
    // Armament and defensive systems
    laserCannons: Integer;         // Number of laser cannons on board
    protonTorpedoCapacity: Integer; // Proton torpedo capacity (0 if not applicable)
    additionalWeapons: String;     // Other weapon systems and defenses (e.g. "ion cannons, deflector shields, missile launchers")
    
    // Association to status
    status: Association to FighterStatus;
}
