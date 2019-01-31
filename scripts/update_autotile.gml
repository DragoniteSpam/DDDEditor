/// void update_autotile(EntityAutotile);

// i really don't like mixing bools and floats but it's just
// so much faster this way
/*
argument0.segment_id=Stuff.autotile_hashes[
    (argument0.neighbors[0]!=noone)<<0|
    (argument0.neighbors[1]!=noone)<<1|
    (argument0.neighbors[2]!=noone)<<2|
    (argument0.neighbors[3]!=noone)<<3|
    (argument0.neighbors[4]!=noone)<<4|
    (argument0.neighbors[5]!=noone)<<5|
    (argument0.neighbors[6]!=noone)<<6|
    (argument0.neighbors[7]!=noone)<<7];
*/

var value=(argument0.neighbors[0]!=noone)<<0|
    (argument0.neighbors[1]!=noone)<<1|
    (argument0.neighbors[2]!=noone)<<2|
    (argument0.neighbors[3]!=noone)<<3|
    (argument0.neighbors[4]!=noone)<<4|
    (argument0.neighbors[5]!=noone)<<5|
    (argument0.neighbors[6]!=noone)<<6|
    (argument0.neighbors[7]!=noone)<<7;

argument0.segment_id=Stuff.autotile_hashes[value];

debug(value)
/*
 * * * * *
 * 0 1 2 *
 * 3   4 *
 * 5 6 7 *
 * * * * *
 */
