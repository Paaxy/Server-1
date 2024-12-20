package com.yourname.eaglercraftepkloader;

import org.bukkit.Bukkit;
import org.bukkit.World;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.plugin.java.JavaPlugin;

import java.io.File;

public class EaglercraftEPKLoader extends JavaPlugin {

    @Override
    public void onEnable() {
        // When the plugin is enabled, log a message
        getLogger().info("EaglercraftEPKLoader plugin enabled!");
    }

    @Override
    public void onDisable() {
        // When the plugin is disabled, log a message
        getLogger().info("EaglercraftEPKLoader plugin disabled!");
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        // If the player uses the /load-epk command
        if (command.getName().equalsIgnoreCase("load-epk")) {
            if (args.length != 1) {
                sender.sendMessage("Usage: /load-epk <worldname>");
                return false;
            }

            String worldName = args[0];
            World world = loadEPKWorld(worldName);

            if (world != null) {
                sender.sendMessage("World " + worldName + " loaded successfully!");
            } else {
                sender.sendMessage("Failed to load world: " + worldName);
            }
            return true;
        }
        return false;
    }

    public World loadEPKWorld(String worldName) {
        // Replace this path with where the EPK files are located
        File worldFolder = new File(getServer().getWorldContainer(), "worlds/epk");

        File worldFile = new File(worldFolder, worldName + ".epk");

        if (!worldFile.exists()) {
            getLogger().warning("EPK file not found: " + worldName + ".epk");
            return null;
        }

        // This is a placeholder for actual EPK file handling logic
        // If you have a converter, this is where you'd invoke it to load the EPK data
        // For now, just load the world assuming it’s a valid Minecraft world in MCA format.
        return Bukkit.createWorld(new org.bukkit.WorldCreator(worldName));
    }
}
