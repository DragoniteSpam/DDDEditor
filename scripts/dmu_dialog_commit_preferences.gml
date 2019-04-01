/// void dmu_dialog_commit_preferences(UIThing);

ini_open(".\data.ini");
ini_write_real("config", "color", Stuff.setting_color);
ini_write_real("config", "bezier", Stuff.setting_bezier_precision);
ini_write_real("config", "backups", Stuff.setting_backups);
ini_write_real("config", "autosave", Stuff.setting_autosave);
ini_write_real("config", "alphabetize", Stuff.setting_alphabetize_lists);
ini_close();

script_execute(argument0.root.commit, argument0.root);
