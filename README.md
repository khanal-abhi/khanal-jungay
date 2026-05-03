# Background

Often times, we want to implement a custom HAL for an interface that is provided by AOSP. One of the best starting points is to look at an existing implementation, bring it over to your custom board, and then make the changed based on your hardware. I wanted to capture this using a board derived from cf_x86_64 so that anyone with a system powerful enough to build aosp can test out the process easily.

## Create a new Board (optional, only follow this if you need to add a new board)

1. Determine the board that your new board will be based of. In our case, our new board will extend cf_x86_64. Once that is decided, create a new structure to house your board under devices. I chose: `device/khanal/jungay`.
2. Create the necessary file structure to make it valid:
   a. AndroidProducts.mk - Where you can add the new lunch targets
   b. BoardConfig.mk - Where you will extend the base board with custom board specific details, like any new sepolicy dirs, kernel command line etc.
   c. device.mk (or following cf convention - <devicename>.mk) - where you will add device specific details like which packages to include

## Add the custom HAL (I chose powerstats for this example)

1. Since cf uses PowerStats hal default included in the interface bundled with android.hardware.power - I had to remove it from cf's PRODUCT_PACKAGES if the model was jungay.
2. Next, I copied over the default implementation of powerstatshal from the hardware/interfaces/power... path.
3. Finally, I stripped away the things I did not need from the default impl and made my own simepl fake residency info.
4. Then it was iterative dev until I named things tied to jungay, and the only "new" thing I added was the se file_contexts to attach the correct powerstats-exec type to my custom implementation of the power hal
5. As you can see from the commented out code, I did disable se linux enforcement while developing to iterate quicker. But once things were done - I re-enabled it.
