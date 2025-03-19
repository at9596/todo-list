import ApplicationController from "controllers/application_controller"
import StimulusReflex from "stimulus_reflex";

export default class extends ApplicationController {
  connect () {
    StimulusReflex.register(this);
  }
}
