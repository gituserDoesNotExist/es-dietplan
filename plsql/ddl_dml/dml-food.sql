INSERT INTO food (
    id,
    name
) VALUES (
    seq_food.nextval,
    'apple'
);

INSERT INTO vitamine (
    id,
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
    seq_vitamine.nextval,
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
    seq_mineralstoffe.nextval,
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
    fett,
    eiweiss,
    kohlenhydrate,
    food_id
) VALUES (
    seq_brennstoffe.nextval,
    2,
    2,
    2,
    1
);