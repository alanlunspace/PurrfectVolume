class Volimiter {
  constructor(appName, maxVolume) {
    this.app = Application.currentApplication();
    this.app.includeStandardAdditions = true;
    this.appName = appName;
	this.deviceName = "Hidizs S9Pro";
    this.maxVolume = maxVolume;
  }

  get currentVolume() {
    const { outputVolume } = this.app.getVolumeSettings();
    return outputVolume;
  }

  get isHeadphones() {
    const outputDevice = this.app.doShellScript('/usr/local/bin/SwitchAudioSource -c');
    return outputDevice === this.deviceName;
  }

  limitVolume() {
    if (!this.isHeadphones) {
      return;
    }

    if (this.currentVolume > this.maxVolume) {
      this.app.beep();
      this.app.setVolume(null, { outputVolume: this.maxVolume });
    }
  }

  showNotification() {
    this.app.displayNotification("", {
      withTitle: this.appName,
      subtitle: `Limiting your 🎧 ${this.deviceName} volume to ${this.maxVolume}% to protect your ears`
    });
  }
}

const PurrfectVolume = new Volimiter("Purrfect volume 😸", 40);
PurrfectVolume.showNotification();

function idle() {
  PurrfectVolume.limitVolume();
  return 0.1;
}
