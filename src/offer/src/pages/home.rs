use yew::prelude::*;
use yew_router::prelude::*;
use crate::{Route};

pub struct Home;

impl Component for Home {
    type Message = ();
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <div class="tile is-ancestor is-vertical">
                <div class="tile is-child hero">
                    <div class="hero-body container pb-0">
                        <h1 class="title is-1">{ "Welcome to Offer" }</h1>
                    </div>
                </div>
                <div class="tile is-parent container">
                    { self.view_info_tiles() }
                </div>
                <div class="tile is-child">
                    <figure class="image is-6by1">
                        <img alt="A random image for the input term 'yew'." src="https://source.unsplash.com/random/1200x200/?yew" />
                    </figure>
                </div>
            </div>
        }
    }
}

impl Home {
    fn view_info_tiles(&self) -> Html {
        html! {
            <>
                <div class="tile is-danger is-child box" id="cta">
                    <Link<Route> classes={classes!("title")} to={Route::Posts}>
                        { "Mua hàng" }
                    </Link<Route>>
                </div>
            </>
        }
    }
}
