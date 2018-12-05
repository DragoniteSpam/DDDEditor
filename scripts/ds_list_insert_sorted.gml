/// int ds_list_insert_sorted(list, value);
// inserts a value at the correct position in a sorted list.
// returns the index of addition, or -1 if the value is already
// in the list or some other failure occurs. will produce
// unpredictable behavior (probably an infinite loop) if the
// list is not sorted.

var istart=0;
var iend=ds_list_size(argument0);
var imiddle=mean(istart, iend);

if (iend==0){
    ds_list_add(argument0, argument1);
    return 0;
}

var value_test=string_lower(argument1);

while (istart<iend){
    var mid=argument0[| imiddle];
    var mid_test=string_lower(mid);
    if (mid_test==value_test){
        if (mid==argument1){
            return -1;
        } else if (mid<argument1){
            pretty sure im making this harder than i need to,
            look up binary list insertion somewhere else
        } else {
        }
    } else if (mid
}

return -1;
