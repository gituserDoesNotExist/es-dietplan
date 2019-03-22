INSERT INTO food_metadata (
    id,
    created_at,
    last_modified,
    name
) VALUES (
    seq_food_metadata.NEXTVAL,
    systimestamp,
    systimestamp,
    'apple'
);

INSERT INTO vitamine (
    id,
    created_at,
    last_modified,
    vitamin_a_retinol,
    vitamin_a_betacarotin,
    vitamin_b1,
    vitamin_b2,
    vitamin_b6,
    vitamin_b12,
    vitamin_c,
    vitamin_d,
    vitamin_e,
    vitamin_k,
    food_id
) VALUES (
    seq_vitamine.NEXTVAL,
    systimestamp,
    systimestamp,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    1
);

INSERT INTO mineralstoffe (
    id,
    created_at,
    last_modified,
    calcium,
    chlorid,
    eisen,
    fluorid,
    iodid,
    kalium,
    kupfer,
    mangan,
    magnesium,
    natrium,
    phosphor,
    schwefel,
    zink,
    food_id
) VALUES (
    seq_mineralstoffe.NEXTVAL,
    systimestamp,
    systimestamp,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    1
);

INSERT INTO brennstoffe (
    id,
    created_at,
    last_modified,
    fett,
    eiweiss,
    kohlenhydrate,
    food_id
) VALUES (
    seq_brennstoffe.NEXTVAL,
    systimestamp,
    systimestamp,
    2,
    2,
    2,
    1
);