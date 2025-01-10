import express from 'express'

const rootRouter = express.Router()


rootRouter.get(`/`, (request, response, next) => {
    response.json(`ok`);
});

// rootRouter.use("/likes", likeRoutes);
// rootRouter.use("/ratings", ratingRoutes);
// rootRouter.use("/orders", orderRoutes);

export default rootRouter;